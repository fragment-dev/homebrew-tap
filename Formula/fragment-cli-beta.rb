require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4496.0.0-darwin-x64.tar.gz"
    sha256 "7028e690bba449a02e86a397997d507332fb5dbe8269c7715434beb245084d45"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4496.0.0-darwin-arm64.tar.gz"
      sha256 "d218ec3d33e2f0331ed92b35d6e78dd6462573b67f1a519036055cf294cf2024"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4496.0.0-linux-x64.tar.gz"
    sha256 "74b84199ebeb3f991dc8d727a201189cd822cc099de05deefc9d6675e34e931e"
  end
  version "4496.0.0"
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
