require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5048.0.0-darwin-x64.tar.gz"
    sha256 "3230a8d5cc6aef32926dc2673df56dfccbcccb00041affbda89e00188ee89a93"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5048.0.0-darwin-arm64.tar.gz"
      sha256 "0905b0515f737415c75637bac4eb8f8ccefee0543605804ebe0ef31c2b8c7995"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5048.0.0-linux-x64.tar.gz"
    sha256 "747f60829384b105be9b222c6f056bb05107ce3c84cad59b751aff02b2329155"
  end
  version "5048.0.0"
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
