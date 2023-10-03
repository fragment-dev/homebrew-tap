require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3746.0.0-darwin-x64.tar.gz"
    sha256 "43498da025dcd19d42ee51c15639397d5e57e7fc05ee7792a0c6afe8353af68a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3746.0.0-darwin-arm64.tar.gz"
      sha256 "8ec4f079d744d210f91f6bbf85e0e563f89d6b4867822fe7028d33f51f4171e8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3746.0.0-linux-x64.tar.gz"
    sha256 "e9388829d120f4241eaf3078a2848347105d43daf882a0e7c28540bc3831b968"
  end
  version "3746.0.0"
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
