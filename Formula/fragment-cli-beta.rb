require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2712.0.0-darwin-x64.tar.gz"
    sha256 "8b4c94c8deb7cfdc2ea651245fc9bb4a36d6a036b1c3b511542f2eaf84e4de35"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2712.0.0-darwin-arm64.tar.gz"
      sha256 "8d63fa7a32fe5ebf90a5ec6678cb8d4b209ff534f29f11d8dfcb841c0530dd51"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2712.0.0-linux-x64.tar.gz"
    sha256 "ecce6dfe33a054d49b771e931bfd06bfb1b71428ca720db84a660157fa98e9e1"
  end
  version "2712.0.0"
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
