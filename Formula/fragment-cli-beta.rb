require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4078.0.0-darwin-x64.tar.gz"
    sha256 "3164eda346f86f91d04c6080132f4c8872d0ab14df96d01387f4834b2aa9daa1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4078.0.0-darwin-arm64.tar.gz"
      sha256 "87fbcb46751c8d5e87e51d097541c2bcef9b064f3b8a296798311731a86609e3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4078.0.0-linux-x64.tar.gz"
    sha256 "2bda9aa14028ae4e2798f2df7ca70c8916cfd397dd8e2c822c96403f84741cdb"
  end
  version "4078.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
