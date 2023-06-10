require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.9-darwin-x64.tar.gz"
    sha256 "30736ede64785384407fe56205cd70182668e08ca1912d7faeb00d7441b38c1a"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.9-darwin-arm64.tar.gz"
      sha256 "3a6fdab8ea30557043e74585bc60482dafa253ea805c20df5018bd26167b11ec"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.9-linux-x64.tar.gz"
    sha256 "ff03a0fb931659127b472a98ba26bd06a7dfd4b89180f59ac39ae1c3c46be1f6"
  end
  version "2023.6.9"
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
