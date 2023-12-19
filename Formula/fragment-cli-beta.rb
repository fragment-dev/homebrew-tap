require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4173.0.0-darwin-x64.tar.gz"
    sha256 "57b444e7d373d1072e911f40a78d95bfb8054bfed8ecfc459d3fea905df1aad2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4173.0.0-darwin-arm64.tar.gz"
      sha256 "14cd7dc042860b0782d9d3f3db90a22e8cffc99d9385bfe3d057cb3fce9f1210"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4173.0.0-linux-x64.tar.gz"
    sha256 "4dd9c90f811521e296c5c37c8acc94782462a05bdf5b42c8de267b2a13ba1f0b"
  end
  version "4173.0.0"
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
