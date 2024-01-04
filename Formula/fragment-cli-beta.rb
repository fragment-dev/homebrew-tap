require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4270.0.0-darwin-x64.tar.gz"
    sha256 "7313351ec87f2259297e497ecaeb5b98aed974fda650bc617d6371e37f6a49b2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4270.0.0-darwin-arm64.tar.gz"
      sha256 "34f9d868c341ffd675e8c6360d9ffb7017bd1ee87249f95d3e766b0695d0ada9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4270.0.0-linux-x64.tar.gz"
    sha256 "2f308e6c5559f08ffd382b5bae3389a315caa1f4986ea09464d9842b46ef74e7"
  end
  version "4270.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
