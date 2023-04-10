require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2398.0.0-darwin-x64.tar.gz"
    sha256 "c54ce8578b8a1354faa43edd85f4a9c5cd167feb25965f45586db8082613bc8f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2398.0.0-darwin-arm64.tar.gz"
      sha256 "339bf4c0620ca73e8013fc4f3c9b435b13b282716cfbec4428e2f97670d6d6ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2398.0.0-linux-x64.tar.gz"
    sha256 "7029e2f7290966bb5c7c9fc0a9ee2675aa8e5776e6837cadd8552a758a1612cc"
  end
  version "2398.0.0"
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
