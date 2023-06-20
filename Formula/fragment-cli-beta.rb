require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2879.0.0-darwin-x64.tar.gz"
    sha256 "88888c16cd532a954c63f0e3a45bfae87ec25ad7886596604681a58af927cfeb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2879.0.0-darwin-arm64.tar.gz"
      sha256 "4d0d405e54d5fc284fb42e23993b4bf0608631b73436aec6130f08e64bf0d53d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2879.0.0-linux-x64.tar.gz"
    sha256 "6ca70ea9b2c12f66b5edc7352a388b7cf2915abe00127201b9040dc5f8f410b3"
  end
  version "2879.0.0"
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
