require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3806.0.0-darwin-x64.tar.gz"
    sha256 "7933f5dd375bdb33868a221d9ae95090dac565aee70e04ac8d187aa0af357f5f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3806.0.0-darwin-arm64.tar.gz"
      sha256 "4f348c962fff3eb8d3440cc405e37875a6abbc15ff8df437927608f237fb2785"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3806.0.0-linux-x64.tar.gz"
    sha256 "57ea367f9b3a1ad4f1e0a364e86f928ac9874e73db19cdb862806648db6f8481"
  end
  version "3806.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
