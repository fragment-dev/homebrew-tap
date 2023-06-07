require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2812.0.0-darwin-x64.tar.gz"
    sha256 "dc81307f0bd6af2b5cc91651f5a3072f5d35c76e9e84882a59e3ff0e8cb0ab48"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2812.0.0-darwin-arm64.tar.gz"
      sha256 "d6febcb63a382a26e2c846029fa82e232ea934bd0795811738998c17bc4a6229"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2812.0.0-linux-x64.tar.gz"
    sha256 "d8ac08655af96a9ce7ec0e651400284906859ec009a462d73d612d2029e50b9a"
  end
  version "2812.0.0"
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
