require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.20-darwin-x64.tar.gz"
    sha256 "6934c80af23ab723e244ac596e4498065b7f7b93f23f18d4ef276aa299a8b793"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.20-darwin-arm64.tar.gz"
      sha256 "1b2955928eb18074f182229f707a7a1c83adafa380949defbeef79e33aa7cb28"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.2.20-linux-x64.tar.gz"
    sha256 "0297493b9a813a25fbdbcbec541d480d3acc78b9861104ad86cfd532c23d1200"
  end
  version "2023.2.20"
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
