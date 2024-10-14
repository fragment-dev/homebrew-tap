require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5659.0.0-darwin-x64.tar.gz"
    sha256 "aeacbc4659e054eeb675fe2aeeaae1f5bd8a9eec16ab3b99242e3ce7a1cb683b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5659.0.0-darwin-arm64.tar.gz"
      sha256 "8e672e6e059a5b958304d7f7a7bcb50541e5dbceaa4080f2ece1116fef768d54"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5659.0.0-linux-x64.tar.gz"
    sha256 "d99a4c297e41bbf789cffb262dbe284d067866b4952673ca3127aac15519fa77"
  end
  version "5659.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
