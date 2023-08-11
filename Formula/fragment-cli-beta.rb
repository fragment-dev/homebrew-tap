require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3296.0.0-darwin-x64.tar.gz"
    sha256 "108e2cb76788325370c64acbe0333c360184b092b6bf06444cf847f5183575a1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3296.0.0-darwin-arm64.tar.gz"
      sha256 "02d1de5c1b205a5369f3f1b869a7c6b441f89f52ebd447c7c517bab64cf71395"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3296.0.0-linux-x64.tar.gz"
    sha256 "61266b884113482f5cd86843c55315007a1982da738e2a8c8246db82ac054ab2"
  end
  version "3296.0.0"
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
