require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4302.0.0-darwin-x64.tar.gz"
    sha256 "1f46f840abb63664612637c416b6151a7adce974c7b1b69b5edb1269e9f61767"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4302.0.0-darwin-arm64.tar.gz"
      sha256 "5ea53f8cde709c15ea76b1522948fa5ffd3835ad02c5fe4b076cc28ece78079b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4302.0.0-linux-x64.tar.gz"
    sha256 "8c6507911f0ee68510a1db064066f596be5eb2350c6f7b01b811020ddd0a60ae"
  end
  version "4302.0.0"
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
