require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6499.0.0-darwin-x64.tar.gz"
    sha256 "3841811a87aeca7398a7031470a11f39365dd9ff99d98e45a785bd28b24c450a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6499.0.0-darwin-arm64.tar.gz"
      sha256 "eb5b980fac491413d9be9486f2d07a5ccfa37e434ddc09fff378b2703d73e995"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6499.0.0-linux-x64.tar.gz"
    sha256 "723f6f00a90528d1e6d25085a34d8e46e407f2521f04eb14d028ee7730a9f0fd"
  end
  version "6499.0.0"
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
