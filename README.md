# Homebrew Tap for AgentBoot

```bash
brew tap agentboot-dev/agentboot
brew install agentboot
```

## macOS Tahoe (macOS 26) Known Issue

Homebrew's sandbox is incompatible with macOS Tahoe (macOS 26.x). The `nice` command
is blocked inside the sandbox, causing formula builds that run `npm install` to fail with:

```
nice: Operation not permitted
Error: Failure while executing; `/usr/bin/sandbox-exec ...` exited with 126.
```

**This affects all Homebrew formulae that use npm, not just AgentBoot.**

### Workaround

Install via npm instead:

```bash
npm install -g agentboot
agentboot --version
```

Or use npx without installing:

```bash
npx agentboot --help
```

### If you already have a partial Homebrew install

If `brew install agentboot` partially completed (dependencies installed but the
formula build failed), clean up and use npm:

```bash
brew uninstall agentboot 2>/dev/null
npm install -g agentboot
```

### Status

This is tracked upstream in Homebrew: the sandbox enforcement in macOS Tahoe breaks
the `nice` wrapper that Homebrew uses for build steps. When Homebrew ships a fix,
`brew install agentboot` will work normally again.

macOS Sequoia (macOS 15.x) and earlier are not affected.
