require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4004.0.0-darwin-x64.tar.gz"
    sha256 "c558ea5429f18348c792f7ccda17fa8abee6faa5c38e37cf8a17cecbb2c0a220"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4004.0.0-darwin-arm64.tar.gz"
      sha256 "10da676dfdbe6b9fce6142056feedc06dea70188bbb9be7ba9e0aa8dfb803ed6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4004.0.0-linux-x64.tar.gz"
    sha256 "0dbccfbc9ed9a54fc71a852158a8fdd666324f970645db27cbdde5b49551b790"
  end
  version "4004.0.0"
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
