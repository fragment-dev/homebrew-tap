require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3043.0.0-darwin-x64.tar.gz"
    sha256 "c20665acde27d26981e82ab67faf36bb1f2c0360f4d639697ebb0c4cfa0f2bad"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3043.0.0-darwin-arm64.tar.gz"
      sha256 "3d8454c19fd66d03f420881b9354be496acdb2f621e493f1c2222acaa4b388ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3043.0.0-linux-x64.tar.gz"
    sha256 "8432d4ab10ff13ba20ec7cd9f00c7ed603ce12dfb79f85e54f4f528a54bee81d"
  end
  version "3043.0.0"
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
