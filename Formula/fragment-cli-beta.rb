require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4986.0.0-darwin-x64.tar.gz"
    sha256 "e1517f490c46a06f29bd56f0c06b7abaddcdd663538ba4452a53e3caf36e2a73"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4986.0.0-darwin-arm64.tar.gz"
      sha256 "31c42545330329df142220efee210405dc81976069d42a95a5e3f066717dbfa6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4986.0.0-linux-x64.tar.gz"
    sha256 "3ef2a1b3198865f123f851b885dfa4eef6dfa404be2890c77c162fa4f5fcf146"
  end
  version "4986.0.0"
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
