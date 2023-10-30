require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.30-darwin-x64.tar.gz"
    sha256 "2a37ff57b7ab040395fcd6b0ae95bf5ab5bab3c911a6bfc6e7908d71984a3d20"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.30-darwin-arm64.tar.gz"
      sha256 "6f4ea9e7f2930be8a64e25d2243bce3719749afefeef383687c5dfdaeb219b93"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.30-linux-x64.tar.gz"
    sha256 "ef12808f7bbd5abe478082555c161ca5327a30becf6bdd9f9256472c0b93129c"
  end
  version "2023.10.30"
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
