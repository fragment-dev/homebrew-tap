require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2786.0.0-darwin-x64.tar.gz"
    sha256 "660fbabcd0d4f03b1a6d5ef2a8f57f238fb57f9a644aa406c02075e27671a3da"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2786.0.0-darwin-arm64.tar.gz"
      sha256 "93b19dec3b6bf9e96bc16765427af64652a958dea70d5ca15478c85a5ff29eb1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2786.0.0-linux-x64.tar.gz"
    sha256 "431766145a59d16c04a2243d45c281db73a2ffb5b8392154612143252ef92202"
  end
  version "2786.0.0"
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
