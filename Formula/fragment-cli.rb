require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.19-darwin-x64.tar.gz"
    sha256 "387d46da7b26d13d560e6710fbbffe08f25eb30408acf1f64ed8932644c92be2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.19-darwin-arm64.tar.gz"
      sha256 "5f4710a87948128db8746c301b6ccac1e8c120bd781efd4884479f19b5225e4c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.19-linux-x64.tar.gz"
    sha256 "a7f724c42581695bd2cf024154f71645ce64a02e9251cf66b9c9b3c522b061d5"
  end
  version "2023.12.19"
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
