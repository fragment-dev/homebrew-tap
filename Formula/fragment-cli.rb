require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.25-1-darwin-x64.tar.gz"
    sha256 "a3f062e11caf0ea6a57083094e02582d73ca35cd4769cd65779b6a9e8d886708"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.25-1-darwin-arm64.tar.gz"
      sha256 "6dd5d27e988429805525139fb04ab943da7f104b47ad65b291e594ce46a5b54d"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.25-1-linux-x64.tar.gz"
    sha256 "45e15d7d9ff504b447c790de68662f9a5875fa88c163aee9ac06f6528cba43e2"
  end
  version "2023.5.25-1"
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
