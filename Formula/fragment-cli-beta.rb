require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2720.0.0-darwin-x64.tar.gz"
    sha256 "410c669f272d49537a010ac519b26ee25784591dd70315975402e3dc80aafff0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2720.0.0-darwin-arm64.tar.gz"
      sha256 "6ea4143253c26dbc506b4c1ebbeaa9518056574a09badcdf936f784d7b93c005"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2720.0.0-linux-x64.tar.gz"
    sha256 "6ca12e209d73b0411f25aadeac567ea2dcc8886cca341e25d56285cac03bf1bf"
  end
  version "2720.0.0"
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
