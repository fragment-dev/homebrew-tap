require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5740.0.0-darwin-x64.tar.gz"
    sha256 "fdaf24eaccd27cf705411d73f494808910e47925f4e9cf9e767e4af2e8ac9344"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5740.0.0-darwin-arm64.tar.gz"
      sha256 "74dcb63c52d190c4edd16c4f25a6c209027ed19a3e630445493876beb9a7c35e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5740.0.0-linux-x64.tar.gz"
    sha256 "cb41356561bd4e03cb4bdc23b059ebbc79fe035006b2941c00b536d8ba59ff9f"
  end
  version "5740.0.0"
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
