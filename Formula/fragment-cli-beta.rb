require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2381.0.0-darwin-x64.tar.gz"
    sha256 "31dc176a35dbf818b6c38b7d468199a5bbac3f40ddcb0f557e4f9379307bee7d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2381.0.0-darwin-arm64.tar.gz"
      sha256 "e3096d1829a0e8eb002782d2f2cc4dc58c16687e5ad9ae5ce3feb451d6db28bb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2381.0.0-linux-x64.tar.gz"
    sha256 "7c83d15c80107b1e106212c4122880da9a60e5f1d3477268fd2523ee65045ba6"
  end
  version "2381.0.0"
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
