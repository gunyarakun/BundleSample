cc_flags = '-s FULL_ES2=1 -DGL_GLEXT_PROTOTYPES=1'
html_flags = '-s TOTAL_MEMORY=134217728'
# html_flags += ' --pre-js mem_check.js'

config = {
  version: 1,
  xcodeproj_path: 'BundleSample.xcodeproj',
  xcodeproj_target: 'BundleSample',
  a2o_targets: {
    debug: {
      xcodeproj_build_config: 'Debug',
      flags: {
        cc: "-O0 -DDEBUG=1 #{cc_flags}",
        html: "-O0 -s OBJC_DEBUG=1 #{html_flags}"
      }
    },
    release: {
      xcodeproj_build_config: 'Release',
      flags: {
        cc: "-Oz #{cc_flags}",
        # NOTE: -s AGGRESSIVE_VARIABLE_ELIMINATION=1 doesn't work
        html: "-O2 -s ALIASING_FUNCTION_POINTERS=0 #{html_flags}"
      }
    },
    profile: {
      xcodeproj_build_config: 'Debug',
      flags: {
        cc: "-O0 -DDEBUG=1 #{cc_flags} --tracing",
        html: "-O0 -s OBJC_DEBUG=1 #{html_flags} --tracing"
      }
    }
  }
}

# puts config

config
