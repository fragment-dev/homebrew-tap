require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3245.0.0-darwin-x64.tar.gz"
    sha256 "b95cbae2321d62f4ff3481ae9ec151477ec1e11a99b2157a592bc3bff68818de"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3245.0.0-darwin-arm64.tar.gz"
      sha256 "dbb295b2fd6a0a6436e983a5e164c662b75b0c3cf5891dd18c7db8d6bcea1179"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3245.0.0-linux-x64.tar.gz"
    sha256 "5910e656517fb393e37983051e953887d3e0058cd52a160cd2e5df62db31ad86"
  end
  version "3245.0.0"
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
