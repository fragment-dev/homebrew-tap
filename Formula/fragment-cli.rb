require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.4-darwin-x64.tar.gz"
    sha256 "380fdfcb69bd97d043f30c574683012d87eb4ddefa7bfd141fbfcba7a292aa3c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.4-darwin-arm64.tar.gz"
      sha256 "655ad70aa393452a8304ce0d015a32879a665bca2f1f0e0d3e6aa8424ac80406"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.4-linux-x64.tar.gz"
    sha256 "1357569ccb3fde1894c5553a60291f6bd88556d8b21fc0c115873005e87dbb9e"
  end
  version "2023.9.4"
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
