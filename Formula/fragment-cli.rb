require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.3-darwin-x64.tar.gz"
    sha256 "52765212a7d1ef1a2207b67b55624bed2f9eaaf161a4f90e1787c27b9924bcac"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.3-darwin-arm64.tar.gz"
      sha256 "a2fc9845107f0ffe31e04f22c796558cdca39e5c7359baac41a3faa1fbb47f4c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.3-linux-x64.tar.gz"
    sha256 "4512b5e9d9b4d22aae6546f382cfddceb4ff20714e4ed1b2861e12ca0f2b1a28"
  end
  version "2024.1.3"
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
