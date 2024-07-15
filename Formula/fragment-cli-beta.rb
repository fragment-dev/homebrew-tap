require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5393.0.0-darwin-x64.tar.gz"
    sha256 "fb82a23d56238b9d16f4e6a2fea91d45c1b9e4e29b59edfa4789983f54a53148"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5393.0.0-darwin-arm64.tar.gz"
      sha256 "d0a7bd278cb0708565801a1fa1b24323e0a7869282ce942268a90111dabda675"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5393.0.0-linux-x64.tar.gz"
    sha256 "7e5c8d46d626973828ee2c209543494a53f66d3cfc8ca3fce0b23632a6799e50"
  end
  version "5393.0.0"
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
