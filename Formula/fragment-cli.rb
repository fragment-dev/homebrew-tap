require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-2-darwin-x64.tar.gz"
    sha256 "401d852dad14df4b2b1aacb201a1d82584b4ded699a41503a708da7b9e02897e"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-2-darwin-arm64.tar.gz"
      sha256 "ba25b7a1cd527ab698956c97a993987419b0544c8790e6bc22b3b28e12ce4cd2"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.20-2-linux-x64.tar.gz"
    sha256 "98eea6bc557da381214a33944f34c77561ccf2ba10e3850c5a9bd1b0ef840e36"
  end
  version "2024.12.20-2"
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
