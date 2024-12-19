require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5937.0.0-darwin-x64.tar.gz"
    sha256 "d624de12397db22ce13d55f51a260001bbe04681b7da7c88aa486b895a954226"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5937.0.0-darwin-arm64.tar.gz"
      sha256 "a304535fe66bcf236522b0b10a06d66657db5adff1b438bfc99e030595c7bee2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5937.0.0-linux-x64.tar.gz"
    sha256 "5223633b8ad5b98ec1d1e311f6ecffb1cb2f5ff7cf15b07404f940f5246ecc52"
  end
  version "5937.0.0"
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
