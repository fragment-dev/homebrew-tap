require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3179.0.0-darwin-x64.tar.gz"
    sha256 "32316ea4ca929af7ad2e9796183930707d75f86415b81360068710f115df25cc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3179.0.0-darwin-arm64.tar.gz"
      sha256 "81daed39d225d11aefcb3c7bebca51003bfbd7018634e5b0cdfd374b1fd5a70f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3179.0.0-linux-x64.tar.gz"
    sha256 "df3caafc31050bd20453c31310daaf5f90549285c50b244e6fd92ad5b3f31174"
  end
  version "3179.0.0"
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
