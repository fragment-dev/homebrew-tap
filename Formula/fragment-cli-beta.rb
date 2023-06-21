require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2893.0.0-darwin-x64.tar.gz"
    sha256 "1a87a0f006bbedde8be252cf392c4883f3fc7a207fa2d9c06ed39ad51c384af8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2893.0.0-darwin-arm64.tar.gz"
      sha256 "10f8f880f9b1a58af0a845807140f58963153c3c42b9f4940efe9e905df42067"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2893.0.0-linux-x64.tar.gz"
    sha256 "b7d09727babc3ff533bf9d71941ec4366b1f05378c3d7f95b8f4c985d48ae921"
  end
  version "2893.0.0"
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
