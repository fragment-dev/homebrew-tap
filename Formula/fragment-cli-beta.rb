require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5421.0.0-darwin-x64.tar.gz"
    sha256 "2c4f4f75c5dc4b8501ddcba8aba44a0cb8541220d06360c26470f4c5b93cd517"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5421.0.0-darwin-arm64.tar.gz"
      sha256 "950ce564445fe42d646488c5274d372238e51c800a8f28c351b6e9a24178c638"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5421.0.0-linux-x64.tar.gz"
    sha256 "136c349e3b7d457467875dec33eef1508735863358cd9192cf33fa1701ce7b8a"
  end
  version "5421.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
