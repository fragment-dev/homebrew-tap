require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4803.0.0-darwin-x64.tar.gz"
    sha256 "c6145032a5628e729fdd02a3c775e67d913afe3dafe84f69e941732ee27caa0d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4803.0.0-darwin-arm64.tar.gz"
      sha256 "5e1d20601fccb8b75ef5a2f4fe3e453aa2ed214e5840a06e2ae376bb14ec3227"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4803.0.0-linux-x64.tar.gz"
    sha256 "227aa9310fcac0dbe7cfee4431b389163b87412788f1253e520e162db46f1ae9"
  end
  version "4803.0.0"
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
