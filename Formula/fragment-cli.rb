require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.1-darwin-x64.tar.gz"
    sha256 "436cb710bcb630930f1d5170f59f1353112ca9f9e7c97fa5f187e9919b996396"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.1-darwin-arm64.tar.gz"
      sha256 "06db677eff5f1dd0e022aebacde2739ddf3bfeda67226e82ac83b3db54713050"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.6.1-linux-x64.tar.gz"
    sha256 "c0d329408976db0f52cf06ad0195feca29bbe71ac77e35cc81badd9bd73cde8a"
  end
  version "2023.6.1"
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
