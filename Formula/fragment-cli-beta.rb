require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4153.0.0-darwin-x64.tar.gz"
    sha256 "199caf2c02f5d04805fdbd93a6c0a623fe0d8758c9f44b5ccd5848e7dc323a54"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4153.0.0-darwin-arm64.tar.gz"
      sha256 "f5522a343ed683475ac70ef35d0091777d8dd05d8c94a00587669278a5736b5b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4153.0.0-linux-x64.tar.gz"
    sha256 "91dcbd110c7d819cf22941a384cfbfe92b6ef7b081773f88b4cf2c30a8e00ce6"
  end
  version "4153.0.0"
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
