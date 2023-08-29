require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3422.0.0-darwin-x64.tar.gz"
    sha256 "b9f9240f3b557fc5db791b96427ed48a24f4c5091c2ca58099a29cce02bcda4f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3422.0.0-darwin-arm64.tar.gz"
      sha256 "dc6b423136c8934ce67face9af329c40fc90ff539a01ebdc33ea99a56c7b7ffa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3422.0.0-linux-x64.tar.gz"
    sha256 "4672719993e8e353e3ea65540157e444630b7052e70dc9578c9728106c08f30d"
  end
  version "3422.0.0"
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
