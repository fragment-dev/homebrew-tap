require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2853.0.0-darwin-x64.tar.gz"
    sha256 "1faa14a21a00b0fefe5ce6f9aa184f2b1b5eb94e760a617782d466f2104bfb74"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2853.0.0-darwin-arm64.tar.gz"
      sha256 "152753ccee9fa1e6351d5c5bf0aa09d34bd5ecc458044add5be2600ab4ef6705"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2853.0.0-linux-x64.tar.gz"
    sha256 "9557d0e0745a383b26aa3372e83ac5af61f89219c6f0e3257be91c7b9e28f19b"
  end
  version "2853.0.0"
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
