require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.30-1-darwin-x64.tar.gz"
    sha256 "354aaf03d4e52dd8948b4976e016055ab024c8c44c1c4273cb5aead056134fc4"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.30-1-darwin-arm64.tar.gz"
      sha256 "a90fe8709774ba49fb87a6ac6b69c2cd4f406c57e4d8868eaf4533bf82fd972c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.30-1-linux-x64.tar.gz"
    sha256 "5b43d9ac0b22a9d8363e0c1494791729afc1fabab93df8e9f00835342790f92d"
  end
  version "2023.9.30-1"
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
