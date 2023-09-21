require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3636.0.0-darwin-x64.tar.gz"
    sha256 "03f0865d61e6824a48bc4ccfd3b40ddf60a5919eaf0c00180c1327053c13e95f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3636.0.0-darwin-arm64.tar.gz"
      sha256 "2f9779e5e0e0aaff338701a0bab44c52f2c11cdac842bc755223b1d05d8db2b4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3636.0.0-linux-x64.tar.gz"
    sha256 "6da8f596bf5e65cec41ce200f1fc4727cfbe11dbeb38d3d0e0c0a03f1743cc99"
  end
  version "3636.0.0"
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
