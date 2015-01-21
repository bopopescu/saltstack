def lic():
  import commands
  status, output = commands.getstatusoutput('xe host-license-view')

  if status == 0:
      license = {}
      for line in output.split('\n'):
          line = line.replace(' ', '')
          comps = line.split(':', 1)
          key = comps[0]

          if key != '':
              if len(comps) > 2:
                  val = comps[1:]
                  license[key] = val
              else:
                  license[key] = None

      grains['license'] = license
      return grains
