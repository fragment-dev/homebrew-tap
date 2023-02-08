require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.8-darwin-x64.tar.gz"
    sha256 "4d69d3421e91f6609e6a08a68aa7753e9533b3a48dfd02fa135be1c593249b81"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.8-darwin-arm64.tar.gz"
      sha256 "31f103e22ceaec8849c0139e6e829a0666333fac47c5d34e2d77ac62dda4c6e6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.8-linux-x64.tar.gz"
    sha256 "31434abcd07f43cae041384ed5c91c729623ac37819827f1a92db5b478ce776b"
  end
  version "2023.2.8"
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
