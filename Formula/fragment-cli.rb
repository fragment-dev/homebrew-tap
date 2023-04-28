require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.28-darwin-x64.tar.gz"
    sha256 "2a9367a1dce844dad84e44a733aac44d3132b00fcb6769a782ae2fafdf014588"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.28-darwin-arm64.tar.gz"
      sha256 "5919535f2573cb05acf97850fead32a2cff2b372075f3cdf1e9e183d11be3f5d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.28-linux-x64.tar.gz"
    sha256 "adc5acb354ea8a57226802ba2446feffa0d5482a5dfd8b659a3850c176a6ef14"
  end
  version "2023.4.28"
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
