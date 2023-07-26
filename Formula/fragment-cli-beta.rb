require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3165.0.0-darwin-x64.tar.gz"
    sha256 "857c8049ff1b4a02e376edda8a2d3cc2caff6255f250d94d0621c24becdecb39"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3165.0.0-darwin-arm64.tar.gz"
      sha256 "2f9511366229a2ba274337054f575c0bd83a4f8fe2e156ae81988387b7c53a79"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3165.0.0-linux-x64.tar.gz"
    sha256 "25237a1f2a98bd8e84a5d472fc4c8d04ff7cdc45c68e24f7eb867acd3de889e7"
  end
  version "3165.0.0"
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
