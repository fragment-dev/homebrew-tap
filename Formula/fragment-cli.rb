require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.6-darwin-x64.tar.gz"
    sha256 "207ea26697a7baf0a12b82c818a193072a49046b48bdb2476c44341f8d071d6c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.6-darwin-arm64.tar.gz"
      sha256 "a3c38db3520cac9dd26a92afa9f6c39500536c9e9dd943b223f8fb507d53e649"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.6-linux-x64.tar.gz"
    sha256 "fe17002eb269a3d477d6d0be09883b6943a1cd1834c1ba012e1e1cf075b673d1"
  end
  version "2023.9.6"
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
