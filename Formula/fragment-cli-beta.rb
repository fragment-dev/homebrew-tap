require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4502.0.0-darwin-x64.tar.gz"
    sha256 "84a9f1c69c622a590da7c8c7ce587208b70658e25c00d9aa0c8f0931f4665e1d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4502.0.0-darwin-arm64.tar.gz"
      sha256 "ebfd3688a7a79c7befb369c69dac49e51ea59e65b35819a610437e108127ae77"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4502.0.0-linux-x64.tar.gz"
    sha256 "dded822991db60e146a3c2a8b23854747b35a738d5fb1c7271faa5bf022fc3d5"
  end
  version "4502.0.0"
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
