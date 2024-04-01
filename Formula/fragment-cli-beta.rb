require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4825.0.0-darwin-x64.tar.gz"
    sha256 "16153fdb0ec8bce81ca3ce2585afb3c67db2b71ec32643f71d623ee41a5cc35c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4825.0.0-darwin-arm64.tar.gz"
      sha256 "69b945adf0ab25af6852fda10f50b9aa2118bddb65c429998a33cc67e6f08796"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4825.0.0-linux-x64.tar.gz"
    sha256 "4cd196ab5ebee4fa875bf5fcc701c1d12ad731ddb0853119f20d20ff54ad6657"
  end
  version "4825.0.0"
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
