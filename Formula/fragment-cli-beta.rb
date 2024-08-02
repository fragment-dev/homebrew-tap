require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5462.0.0-darwin-x64.tar.gz"
    sha256 "32974272c7d912683620db1b66a60c3f015af616e1c6b982751750b96392f6ef"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5462.0.0-darwin-arm64.tar.gz"
      sha256 "aa960471955eca13181c17c877d50c760f4e6352ba46381c9e04e33f7e8e5030"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5462.0.0-linux-x64.tar.gz"
    sha256 "685f4cead346665aa35ad33f54c2a0271f1295e574947751c6948c2c176c8e0e"
  end
  version "5462.0.0"
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
