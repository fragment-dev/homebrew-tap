require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5640.0.0-darwin-x64.tar.gz"
    sha256 "3a6318d80f9247f3e8a830c07282f6d8900308874f433eb31e61b3ceab50ee74"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5640.0.0-darwin-arm64.tar.gz"
      sha256 "7bada570e81dcb5d2428091d6aa83df1ddf3ada919e4f085ef7dff5c4357198b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5640.0.0-linux-x64.tar.gz"
    sha256 "184dc248503f937b778d0f88d8ce65c15f826d56fdaf7e9e3455c7024da6bab4"
  end
  version "5640.0.0"
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
