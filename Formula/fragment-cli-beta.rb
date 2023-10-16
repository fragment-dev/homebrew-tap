require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3834.0.0-darwin-x64.tar.gz"
    sha256 "4dd99f1f536bc368849d5844512a39ab23ceeb3eab465f1516094cbefc72752d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3834.0.0-darwin-arm64.tar.gz"
      sha256 "15a10f33b12141d0fe1e93277cd657f2ebfbe19910ab948e8970b5ad6aa66881"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3834.0.0-linux-x64.tar.gz"
    sha256 "1830cf5655313f1bd5b863c20b6a0796ca616b02ab9eed832b069578091b28bd"
  end
  version "3834.0.0"
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
